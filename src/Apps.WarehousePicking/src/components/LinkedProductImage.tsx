import { useEffect, useState } from "react";
import { getClient } from "@microsoft/power-apps/data";
import { dataSourcesInfo } from "../../.power/schemas/appschemas/dataSourcesInfo";
import { bytesToDataUrl, imageMimeType } from "@/utils/Binary";
import { useStyles } from "@/styles/LinkedProductImage.styles";

const client = getClient(dataSourcesInfo);

type LinkedProductImageProps = {
  productId: string;
  imageUrl?: string;
};

// No generated service method downloads a file column's bytes - only upload() is generated -
// so this goes through the low-level client directly, the same one the generated services
// themselves are built on.
export default function LinkedProductImage({ productId, imageUrl = "" }: LinkedProductImageProps) {
  const styles = useStyles();
  const [imageDataUrl, setImageDataUrl] = useState<string | null>(null);

  useEffect(() => {
    let cancelled = false;
    setImageDataUrl(null);

    client
      .downloadFileFromRecord("lab_products", productId, "lab_productimage")
      .then((result) => {
        if (cancelled || !result.success || !result.data?.length) return;
        setImageDataUrl(bytesToDataUrl(result.data, imageMimeType(imageUrl)));
      });

    return () => {
      cancelled = true;
    };
  }, [imageUrl, productId]);

  if (!imageDataUrl) return null;

  return (
    <img
      src={imageDataUrl}
      alt=""
      className={styles.image}
      onError={() => setImageDataUrl(null)}
    />
  );
}
